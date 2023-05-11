<!--
 Copyright (C) 2023 Tudlang
 
 This file is part of AralTools.
 
 AralTools is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 AralTools is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with AralTools.  If not, see <http://www.gnu.org/licenses/>.
-->

# SkedMaker<br/>*The automatic schedule maker for DLSU students*

## Terminologies
| Term | Meaning | Example/Link
| -- | -- | --
| subject | a subject that you take; the course code | `CALENG1`, `GEUSELF`
| offering | a possible offering for that subject, with a specific section, class number, day, modality, slots, etc.; the table row in the 'View Course Offerings' table in the DLSU MLS | [Offering](./classes.dart#L8) class
| OfferingDay | a possible schedule for a particular day; a sequence of offerings that are possible and non-conflicting | [OfferingDay](./classes.dart#L570) class
|M, T, W, H, F, S | corresponds to the days of the week; respectively: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday | -


## How does SkedMaker generate possible weekly schedules
*This is the algorithm that I came up with. The downside is that this algorithm (or my implementation of this algorithm) gets extremely slow the more subjects there is.*

0. The 'Generate' button is pressed
1. For a specific weekday (i.e. Monday, etc.)
    1. Get the list of all offerrings for that day
    2. Generate a weighted directed graph based on that list wherein a vertex is an offering and an edge is formed if (for example) offering A is after offering B and is not conflicting in time and if both are not the same subject. The weight of the edge is the distance of their building and floor.
    3. Get every possible OfferingDay for that day by getting every path possible from every vertex. 
    4. Output that as a `Map` whereing a possible OfferingDay is the key and its summed weight is the value.
2. Now we should have 6 `Map`s for each weekday (Monday to Saturday)
3. Generate a directed graph wherein a vertex is an OfferingDay and an edge is formed if there are no duplicate subjects (excluding MH, TF, and WS offerings). M has edges to TWHFS, T to WHFS, W to HFS, H to FS, and F to S.
4. Get every possible weekly schedule by getting every path possible from every vertex. The path must include all subjects given, and that MH, TF, and WS offerings (if any) are present on both of their days.

The weight is displayed to the user for them to decide on.

## Files

### `classes.dart`
This file contains the `class`es used to store each offering, each day of offerings, and a possible weekly schedule.

### `connection.dart`
This file contains the code to connect to the MLS website.

### `functions.dart`
This file contains all of the computational functions needed.

### `skedmaker_activity.dart`
This file contains the actual UI. This is where the functions are being called at.
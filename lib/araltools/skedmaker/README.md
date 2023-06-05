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
| offering | a possible offering for that subject, with a specific section, class number, day, modality, slots, etc.; the table row in the 'View Course Offerings' table in the DLSU MLS | [Offering](./classes.dart#L25) class
|M, T, W, H, F, S | corresponds to the days of the week; respectively: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday | -


## How does SkedMaker generate possible weekly schedules
*This is the algorithm that I came up with. The downside is that this algorithm (or my implementation of this algorithm) gets slow the more subjects there is.*

0. The 'Generate' button is pressed
1. For each possible list of offerings for each subject: (i.e. if there are `n` subjects with each of them having a number of offerings, then get every possible list of length `n` where each element is one offering per subject.)
    1. Try to add all contents of the list into a weekly schedule. If adding one Offering conflicts, then scrap that entire list and move on to the next possible list.
    2. If successful, output the week then continue to the next possible list.

## Files
| Filename | Function |
| --- | --- |
| `classes.dart` | Contains the `class`es used to store each offering and a possible weekly schedule.
| `connection.dart` | Contains the code to connect to the MLS website.
| `functions.dart` | Contains all of the computational functions needed.
| `models.dart` | Contains the model classes used to store values for the UI.
| `skedmaker_activity.dart`<br/>`skedmaker_activity_windows.dart` | Contains the actual UI. This is where the functions are being called at.
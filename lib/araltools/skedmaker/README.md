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

## Premise
SkedMaker is a tool to create a list of possible schedules, given a list of subjects each having a list of offerings. It also has the option to filter the schedules to your liking.

## Limitations
* SkedMaker is designed and targeted towards _De La Salle University_ students. It may be used by students from other schools, but it might not provide the best experience.
* Only subjects with up to 2 days are supported. 3+ day subjects aren't. [see [#49](https://github.com/tudlang/araltools/issues/49)]
* Whole-day subjects (e.g. LASARE) are not supported. [see [#27](https://github.com/tudlang/araltools/issues/27)]
* Schedule generation may take up high CPU usage, especially the more subjects & offerings you have. [see [#1](https://github.com/tudlang/araltools/issues/1)]
* Offering data does not automatically refresh. To get the latest data, you need to delete the subject and add it again. [see [#21](https://github.com/tudlang/araltools/issues/21)]

## The core algorithm 
0. The 'Generate' button is pressed
1. For each possible list of offerings for each subject: (i.e. if there are `n` subjects with each of them having a number of offerings, then get every possible list of length `n` where each element is one offering per subject.)
    1. Try to add all contents of the list into a weekly schedule. 
    2. If adding one Offering conflicts, then scrap that entire list and move on to the next possible list.
    3. If successful, output the week.
    4. Continue to the next possible list.

## DISCLAIMER
AralTools SkedMaker is not an official De La Salle University product, and is not approved by or associated with De La Salle University. This is a tool created by students in the hopes of adding convenience in the schedule creation process during enlistment/enrollment time.

AralTools SkedMaker is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
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

# Welcome to AralTools!
AralTools is a suite of tools designed to help students.

## List of AralTools
| Name | Description |
| --- | --- |
| [SkedMaker](./lib/araltools/skedmaker) | An automatic class schedule maker for DLSU students. |

## Contributing
Feel free to contribute! Make sure that [Flutter](https://flutter.dev) and [WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) is installed on your machine (WebView 2 is already pre-installed on Windows 11). **For now, only Windows is supported.**

After cloning, please delete [lines 106-117 on `lib/araltools/skedmaker/windows/ui_subjects.dart`](./lib/araltools/skedmaker/windows/ui_subjects.dart#L106) as these are only debug subjects, and these have been gitignore'd.

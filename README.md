# MGS-Master-Collection-Unpaking-Repaking
tools  to help you unpack (extract files from alldata.bin to archives folder ) and repack (create new alldata.bin from archives folder)  , likely from the Metal Gear Solid Master Collection


**I. How to Unpack a .bin Archive (Extract Files)**

1.  **Locate `MGS-Unpaking.bat`.
2.  **Drag and Drop:**
    *   Find the `.bin` archive file you want to unpack (e.g., `some_game_archive.bin`).
    *   Drag this `.bin` file directly onto the `MGS-Unpaking.bat` icon.
    *   Release the mouse button.
3.  **Process:**
    *   A command prompt window will open.
    *   It will display information:
        *   Input File: The `.bin` file you dropped.
        *   Output Folder: A new folder that will be created in the *same directory as your input .bin file*. The folder will be named `[original_filename_without_extension]_extracted` (e.g., if you dropped `some_game_archive.bin`, the output folder will be `some_game_archive_extracted`).
     
**II. How to Repack a Folder into a .bin Archive**

1.  **Prepare Your Folder:**
    *   This will typically be a folder that was previously extracted using `MGS-Unpaking.bat` (e.g., `some_game_archive_extracted`), especially if you've modified some files within it.
    *   Ensure the contents and structure within this folder are correct for the game to read.
2.  **Locate `MGS-Repaking.bat`
3.  **Drag and Drop:**
    *   Drag the *folder* (e.g., `some_game_archive_extracted`) that you want to pack into an archive directly onto the `MGS-Repaking.bat` icon.
    *   Release the mouse button.
  
*   **Output Location Difference:**
    *   **Unpacking:** Creates an `_extracted` folder *next to the input .bin file*.
    *   **Repacking:** Creates the new `.bin` file *in the same folder as the `MGS-Repaking.bat` script*.

This toolset provides a user-friendly way (via drag-and-drop) to interact with the `MArchiveBatchTool.exe` for the specific purpose of modding MGS Master Collection game archives.

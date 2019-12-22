# engraving

Scripts that facilitate development of scores using lilypond.

## project-template

Libraries and scripts used to create the file structure for a new project.

## flaming-libs

Libraries that define house styles and helpful definitions.

## part-format

Scripts that manipulate pdf files to help create and combine booklet-printable versions.

## management

Scripts to help migrate sheet music from old scores repo to song-specific repos and facilitate git tasks. 

# Notes on task workflows

## Tasks common to new and migrated scores

For each song you are creating, create two git repositories:
one named for the song
one named for the song pdfs.  

The naming convention is lower-kebab-case for the song, and appending -pdf for the pdf.
Example: "my-song" and "my-song-pdf"

READMEs are not necessary.  
Choose a Lilypond .gitignore for the song repo, but do not create a .gitignore for the pdf repo.

## Migration from scores

## New projects from template
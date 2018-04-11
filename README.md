# Shared Functions in MATLAB / Octave

## Scope of Project
- These functions support the music sequencer project
- However, they have been separated out for reuse across projects

## Related GitHub repos
- Shared functions: https://github.com/daveryan23/matlab_octave_shared_functions
- Sequencer: https://github.com/daveryan23/music_sequencer_matlab_excel_audacity

## Recommended directory structure
- octave (or matlab! But octave is free...)
  - data
    - <project_name>
      - input
      - output
  - src
    - projects
      - <project_name>
    - shared
    
After creating the directory structure above, synchronise this repo into the 'shared' directory above. The advantage of this structure is it allows shared functions to be reused between different Octave projects, and the large data files to be stored outside of the projects, enabling each project to be small and synced to GitHub separately.

## What I did
- These functions have been developed across 2015-2018
- They are mainly focused on audio

## Tools I used
- MATLAB / Octave

Dr. David Ryan, April 2018

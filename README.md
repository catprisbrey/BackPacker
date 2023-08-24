
![Logo](https://github.com/pemguin005/BackPacker/blob/main/Images/Spalsh.png?raw=true)


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
# BackPacker

A channel packing application for 3D material image files

BackPacker is a simple tool designed to simplify the 3D workflow of game developers and 3D artists. BackPacker allows you to pack multiple PBR image maps into fewer image files by taking advantage of unused, or unnecessary color channels.

Import multiple image maps (like roughness, metallic, emission, ambient occlusion, normal maps, etc). Drag and drop individual color channels into whatever output channels suits your specifications. You have the flexibility to assign specific red, green, blue, and alpha channels from any of the files to generate into any channel of the output image. This can simplify and reduce how many image maps are required to describe your textures.

Input files must be the same resolution, but output file resolution can be selected, and scaled larger or smaller as needed. 

![Screenshot](https://github.com/pemguin005/BackPacker/blob/main/Images/Backpacker-stillshot.png?raw=true)
_Built in the Godot Game engine, some icons may still reflect that_

## Features

- Import and merge the channels from multple image files at once
- Separately assign each red, green, blue, and alpha channel
- Live previews of color channel output
- Easy node based UI makes for obvious channel mapping
- Customize output image size from 8 pixels to 4k resolutions
- Cross platform for Linux x32, Linux x64, and Windows
- Self contained application, no installation necessary
- Entirely Free (Donations accepted at the ![Itch.io page](https://pemguin005.itch.io/backpacker))


## Demo

- Click the +ImageNode button to add more souce images.
- Drag the color handles and connect them to any output color channel. 
- Each channel preview makes it easy to view the channel's output.
- Generate final preview to be sure things look right.
- Adjust the size as needed and hit the export to save.

![Demonstration](https://github.com/pemguin005/BackPacker/blob/main/Images/Backpacker-GithubDemo.gif?raw=true)

- Final images may look semi-transparent, but don't fret. Each channel contains the complete data, it's likely the alpha layer is masking the visual colors.

![Example](https://github.com/pemguin005/BackPacker/blob/main/Images/Brick_packed.png?raw=true)

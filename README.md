
![Logo](https://github.com/pemguin005/BackPacker/blob/main/Images/Spalsh.png?raw=true)


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
# BackPacker

A channel packing application for 3D material image files

BackPacker is a simple tool designed to simplify the workflow and exploration of game developers and 3D artists. This channel packing application streamlines the process of merging mulitple image map channels into new image files, allowing you to pack and consolidate mulitple PBR image maps into fewer image files.

BackPacker allows you to import multiple 3D image map files, such as albedo, roughness, metallic, emission, ambient occulision, normal maps, etc. Select the channels you want to pack accourding to your own requirements. You have the flexibility to assign specific red, green, blue, and alpha channels from any of the files to generate the consolidated output image. This output image contains all the combined data from each color channel, allowing you to efficiently describe materials within your projects with fewer files.

Input files must be the same resolution, but output file resoltion can be selected, and scaled larger or smaller as needed.

![Screenshot](https://github.com/pemguin005/BackPacker/blob/main/Images/Backpacker-stillshot.png?raw=true)
_Built in the Godot Game engine, some icons may still reflect that_

## Features

- Import and merge data from multple image files at once
- Separately assign each red, green, blue, and alpha channels
- Live previews of color channel output
- Easy node based UI makes for obvious channel mapping
- Customize output image size from 8 pixels to 4k resolutions
- Cross platform for Linux x32, Linux x64, and Windows
- Self contained application, no installation necessary
- Entirely Free


## Installation

Just download one of the releases and run it. There is no installation process.

## Demo

- Clicking the +ImageNode button adds more nodes for souce images.
- Drag the color handles and connect them to any output color channel.
- A channel preview makes it easy to spot what data you're including.
- You can generate final preview to be sure things look right.
- Adjust the size as needed and hit the export to save.

![Demonstration](https://github.com/pemguin005/BackPacker/blob/main/Images/Backpacker-GithubDemo.gif?raw=true)

- Final images may look semi transparent, but don't fret. Each channel contains the complete data, it's only the alpha layer masking some of it visually.

![Example](https://github.com/pemguin005/BackPacker/blob/main/Images/Brick_packed.png?raw=true)

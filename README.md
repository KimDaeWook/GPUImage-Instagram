# GPUImage-Instagram

**GPUImage-Instagram** is an (almost) fully fledged open sourced implementation of Instagram's real-time filters view controller. It implements Instagram's 17 real-time filters. GPUImage-Instagram is based on **diwu/InstaFilters**.
but **diwu/InstaFilters** repository is no longer maintenance. So i just create new repository and optimize some code.

### Yes It's A Hack
The most important part, the OpenGL ES shader files and color mapping files that are critical to all those beautiful colors and effects of real-time video filtering, are literally hacked from the Instagram app. But no, the hacking is not difficult, since Instagram hardly spent any effort in hiding them before they released their 2.1 version.

###Requirements
1. iOS 6.0+
2. GPUImage (https://github.com/BradLarson/GPUImage)

###License
Since it's a hack, literally. There's no way you could use those Instagram recipes in your project. But feel free to learn from them. Other than that part, you are welcome to use and distribute this project.

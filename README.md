# GPUImage-Instagram

**GPUImage-Instagram** is an (almost) fully fledged open sourced implementation of Instagram's real-time filters view controller. It implements Instagram's 17 real-time filters. GPUImage-Instagram is based on **diwu/InstaFilters**.
but **diwu/InstaFilters** repository is no longer maintenance. So i just create new repository and optimize some code.

###Filters Gallery
 
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370808/5de29cb8-bc62-11e5-9d64-0ce4cf653411.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370811/5e7f8afa-bc62-11e5-8cbc-c89a8b4fe29a.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370809/5e292ef8-bc62-11e5-934c-ca57b2172896.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370813/60f385d4-bc62-11e5-9953-fa08855fb83c.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370815/6e028c20-bc62-11e5-9e94-b212c83ef153.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370814/6ddeb584-bc62-11e5-9f59-ac2232847473.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370816/6e77a802-bc62-11e5-93cb-876724834b0e.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370817/6e78ea0a-bc62-11e5-9c09-607459550c4d.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370823/70af63ee-bc62-11e5-9381-4445a59d13af.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370830/995d6bf6-bc62-11e5-992e-7947ddb8ecbc.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370818/6eb89bdc-bc62-11e5-9a37-ddbfc946f44d.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370820/6f84da8a-bc62-11e5-9d5a-c53703c58238.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370819/6f763976-bc62-11e5-8e67-4303a6545649.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370822/70446ddc-bc62-11e5-807b-d2d7f1a3744c.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370828/962db85a-bc62-11e5-983b-5c98c03dd1da.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370821/70424e3a-bc62-11e5-8e6e-fae930fcf5e4.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370824/70b9c366-bc62-11e5-9e11-b39a7a919bc2.png)
![filter-image](https://cloud.githubusercontent.com/assets/4777605/12370825/70f0bede-bc62-11e5-9f31-b5c25d0a48bc.png)

### Yes It's A Hack
The most important part, the OpenGL ES shader files and color mapping files that are critical to all those beautiful colors and effects of real-time video filtering, are literally hacked from the Instagram app. But no, the hacking is not difficult, since Instagram hardly spent any effort in hiding them before they released their 2.1 version.

###Requirements
1. iOS 6.0+
2. GPUImage (https://github.com/BradLarson/GPUImage)

###License
Since it's a hack, literally. There's no way you could use those Instagram recipes in your project. But feel free to learn from them. Other than that part, you are welcome to use and distribute this project.

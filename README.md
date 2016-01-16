# GPUImage-Instagram

**GPUImage-Instagram** is an (almost) fully fledged open sourced implementation of Instagram's real-time filters view controller. It implements Instagram's 17 real-time filters. GPUImage-Instagram is based on **diwu/InstaFilters**.
but **diwu/InstaFilters** repository is no longer maintenance. So i just create new repository and optimize some code.

###Filters Gallery
 
![filters](https://cloud.githubusercontent.com/assets/4777605/12370893/af3d7c7e-bc65-11e5-9928-2c85c3e38185.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370896/afb11382-bc65-11e5-9d97-2c02106dce04.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370894/af675d6e-bc65-11e5-893c-881d37a4729a.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370895/af907e9c-bc65-11e5-9785-a523a259e66c.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370897/afba1bc6-bc65-11e5-8c58-ba6b8676048c.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370898/afe4d4e2-bc65-11e5-9ab1-a392c617cdf8.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370899/aff1eb28-bc65-11e5-96bb-05d6e7ddd557.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370900/b01739be-bc65-11e5-820b-5cc4eafbc2a4.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370901/b0b261aa-bc65-11e5-9a73-8d89f25d82c6.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370903/b167515a-bc65-11e5-868b-9098517099e1.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370906/b1a5351a-bc65-11e5-9010-e1942f868009.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370902/b1564b80-bc65-11e5-9766-471f997f2edd.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370904/b16ace16-bc65-11e5-9e86-308dd557c3b4.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370905/b18cc02a-bc65-11e5-9af3-d0ed1638fe9b.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370907/b1b31522-bc65-11e5-9969-6046103854fe.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370908/b1b36b4e-bc65-11e5-837d-120144ffac61.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370910/b1dc1080-bc65-11e5-8073-38e9e9f7169f.png)
![filters](https://cloud.githubusercontent.com/assets/4777605/12370911/b559baa0-bc65-11e5-98fa-21049030b3c2.png)


### Yes It's A Hack
The most important part, the OpenGL ES shader files and color mapping files that are critical to all those beautiful colors and effects of real-time video filtering, are literally hacked from the Instagram app. But no, the hacking is not difficult, since Instagram hardly spent any effort in hiding them before they released their 2.1 version.

###Requirements
1. iOS 6.0+
2. GPUImage (https://github.com/BradLarson/GPUImage)

###License
Since it's a hack, literally. There's no way you could use those Instagram recipes in your project. But feel free to learn from them. Other than that part, you are welcome to use and distribute this project.

InClass Assignment 2  100782088

**Forward rendering vs Deferred Rendering**

In forward rendering, the process follows a direct line. With each geometry passed down until the final image is drawn onto the screen. With Deferred
Rendering, after the geometry has been passed down, there is an extra layer of shading that we can implement allowing for better custom feel. 

(Forward and Deferred Diagram in Diagram Folder)

**Differences**

When it comes to forward rendering there isnt alot of customization as the rendering path is straight onto the screen after the geometry have been passed down.
We see on the Forward Rendering Diagram that their is no editing or shader appiled before it hits the final target, indicating this process is very straight forward based off
the diagram.
However with deferred rendering we have the passed down geometry pointing to a shader that has depth, colors , normal and lighting. This allows us to change settings around 
to have the final target fit our needs.
In the Deferred diagram, the start is the same as Foward but it takes a turn as they all head into a shader then into the final target.
Unlike the Forward rendering the infomation gets passed down into the G-Buffer before it produces the final target image on screen. 

**Explaining Code Snippet 2**

The yellow Highlight in the code is implementing and the shadowColor variable so that it can be seen in the inspector in unity while also being used
later in the code.

The green highlight in the code is using Lmabert lighting, we use the dot product with the normals and Directional lighting to find the difference which we will then use to calculate the
color.rgb as it is effected with the light color rgb and albedo 


The blude highlight in the code is setting the color rgb to the shadowcolor xyz coordinates while mulitpling it with 1 - atten, finally we return the new color
to the Albedo.

The pink highlight in the code is having the color of the Maintex show on the object while setting the albedo to the color rgb then setting the alpha to the albedo, allowing for the 
highlight shadow on the object to be visible with the color chosen

In the picture shown with the black cube with white lighting as you turn or move the object. This can be used when you want to adjust the shadow color on a specific object to make it more distinct.
Adding a texture on to the object while having its on color shadow allows for objects in game scenes to be mor unqiue





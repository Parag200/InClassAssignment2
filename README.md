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

**Ship Movement & Toon & Moving Water**
With the object having a rigidbody, I used the horizontal and vertical input instead of manually typing the code for the WASD. The horizontal and vertical input were multiplied with the float speed relative to the objects XYZ coordinates.

A plane was made with a material, the material is connected to a shader that combines the overlay shader and toon shader.




**Explaining Code Snippet 1**

In the yellow highlight is using the OnRenderImage is used for setting up the final image on the mainCamera in unity, Setting the dimensions for the textures to know the geometry which will 
be used later on in the code

In the blue code we are using Graphics Blit with the source and currentDestination will be drawn on our mainCamera, 


**Ship Toon & Moving Water**








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

**Choose Any Shader (Overlay Shader)**

In this shader, we will be taking 2 textuers and have them overlay each other and placed as the ground or as water. Allowing for good depth and detail on to any game scene.
We first declare 2 main texutes with the over main texture being the one that will overlay the other. We have Scroll X and Y as time changes allowing the overlay shader to show as it ranges from -5 to 5. In the void Surf function we are having the scoll x and y change rates as time goes by. the first main texture will go with the orginally scroll x and y to time as the overlay texture will 
be going at half the rate the main tex, thus showing the 2 textures overlaying. Finally we find the average of the 2 textures which will then be set to the o.Albedo. This shader can be used when the player is looking or running towards a terrain, having the 2 gorund textures move in different rates in time creates movement which can present the player to a different feeling as they move 
their player. Such as lava moving below them as they try to parkour to the end side of the level.

(FlowChart in Folder)


**Resources**

Ship: https://poly.pizza/m/BgSZXwmm7k

Water: https://allfreedesigns.com/water-textures-download-free/

Water Foam: https://www.lughertexture.com/index.php?option=com_virtuemart&view=productdetails&virtuemart_product_id=366&virtuemart_category_id=1

Grass: https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.freestocktextures.com%2Fcache%2Fea%2Fe5%2Feae5d4d1e7382db872aff0601c233f1f.jpg&tbnid=Ur3N-Mzsm3jJ0M&vet=12ahUKEwiul_-Ohf_9AhXqElkFHa77BUIQMygHegUIARD1AQ..i&imgrefurl=https%3A%2F%2Ffreestocktextures.com%2Ftexture%2Fgrass-ground-green%2C785.html&docid=HIzRnqjwD9ZrNM&w=900&h=600&q=ground%20texture%20&hl=en&ved=2ahUKEwiul_-Ohf_9AhXqElkFHa77BUIQMygHegUIARD1AQ

Dirt: https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Ffree-photo%2Funeven-wall-texture-close-up_23-2147626082.jpg&tbnid=_NBVabTJEKoM2M&vet=12ahUKEwiul_-Ohf_9AhXqElkFHa77BUIQMygIegUIARD3AQ..i&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fground-texture&docid=GwKccutubx8CAM&w=626&h=417&q=ground%20texture%20&hl=en&ved=2ahUKEwiul_-Ohf_9AhXqElkFHa77BUIQMygIegUIARD3AQ



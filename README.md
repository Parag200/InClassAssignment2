InClass Assignment 2  100782088

**Forward rendering vs Deferred Rendering**
In forward rendering, the process follows a direct line. With each geometry passed down until the final image is drawn onto the screen. With Deferred
Rendering, after the geometry has been passed down, there is an extra layer of shading that we can implement allowing for better custom feel. 

(Diagram in Diagram Folder)

**Differences**
When it comes to forward rendering there isnt alot of customization as the rendering path is straight onto the screen after the geometry have been passed down.
We see on the Forward Rendering Diagram that their is no editing or shader appiled before it hits the final target, indicating this process is very straight forward based off
the diagram.
However with deferred rendering we have the passed down geometry pointing to a shader that has depth, colors , normal and lighting. This allows us to change settings around 
to have the final target fit our needs.
In the Deferred diagram, the start is the same as Foward but it takes a turn as they all head into a shader then into the final target.
Unlike the Forward rendering the infomation gets passed down into the G-Buffer before it produces the final target image on screen. 
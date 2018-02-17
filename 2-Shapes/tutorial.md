# Drawing

Drawing using d2d is one of the first things anyone using it should learn. In this tutorial, you will learn how to use Screens and the basic functionalities of Renderers.

## Screens

Part of the basic architecture of d2d involves Screens. Screens are simply states of functionality of a program. A Screen dictates what happens every frame and how to handle events. The rationale behind this is the ability to easily switch between different Screens on the Display. 

Screen is a abstract class, so an implementation of it needs to be created in your program. Screens have three methods that need to be implemented, as shown below:

```D
import d2d;

class MyScreen : Screen {

    this(Display container) {
        super(container);
    }

    void handleEvent(SDL_Event event) {
    }

    override void draw() {
    }

    override void onFrame() {
    }

}
```

Note that handleEvent does not need to be overridden, as it is a method implemented by the base Screen class from the EventHandler interface. 

Screens also contain a list of components, which will be discussed in more depth in future tutorials.

Lastly, Screens need to be assigned to the display, which can be done like so:

```D
Display display = new Display(640, 480);
display.screen = new MyScreen(display);
```

When calling `Display.run()`, `the draw()`, `onFrame()`, and `handleEvent()` methods will automatically be called when necessary. For this tutorial, we will only be using the `draw()` method.

## Drawing

Drawing uses the Renderer object, which is automatically created by the Display. The Display can be easily accessed inside a Screen by using `Screen.container`, and from that the renderer can be accessed by using `Screen.container.renderer`. Below is a list of all of the draw methods the renderer can perform:

|Method|Arguments|Description|
|-|-|-|
|clear|None|Clears the screen and fills it|
|drawPoint|iVector|Colors a single pixel at the given location|
|drawLine|iVector, iVector OR Segment(int, 2)|Draws a line between the given points or along the given segment|
|drawRect|iRectangle|Draws the outlines of a rectangle|
|fillRect|iRectangle|Draws and fills in a rectangle|
|drawPolygon!T|iPolygon!T|Draws the outlines of a polygon with T sides|
|fillPolygon!T|iPolygon!T|Draws and fills in a polygon with T sides|

These methods use the d2d objects Vectors, Rectangles, Segments, and Polygons. We will go into more depth on these objects in future tutorials, but for now, know that each have aliases denoting what datatype they use. In graphics, integers will always be used. The aliases iVector, iRectangle, and iPolygon are what will be used. Below is a table of all of the basic objects that will be used in graphics:

|Object|Constructor Parameters|Description|
|-|-|-|
|iVector|int x, int y|A vector which can represent a point and a distance.|
|Segment!(int, 2)|iVector initial, iVector terminal|An object representing a segment between two points.|
|iRectangle|int x, int y, int width, int height|An object with a location and width and height.|
|iPolygon!T|iVector()[T] vertices|A two dimensional object enclosed by T sides.|

Additionally, each of the draw and fill methods can be passed a color, else they will use the renderer's color. The renderer's color can be set by using the property `drawColor`: `renderer.drawColor = Color(r, g, b);`.

d2d comes with a set of predefined colors, under the enumeration PredefinedColor. Colors available are RED, GREEN, BLUE, YELLOW, MAGENTA, CYAN, WHITE, PINK, ORANGE, LIGHTGREY, DARKGREY, and BLACK, and can be accessed by using PredefinedColor.<COLORNAME>.

## Conclusion

Now that you have all of this information available, try to draw something yourself. If you get confused, refer to the example code provided for this tutorial. The next tutorial will discuss event handling in d2d.

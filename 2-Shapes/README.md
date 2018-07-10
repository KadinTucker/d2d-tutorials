# Drawing

Drawing using d2d is one of the first things anyone using it should learn. In this tutorial, you will learn how to use Activities and the basic functionalities of Renderers.

## Activities

Part of the basic architecture of d2d involves Activities. Activities define how the display will run. Specifically, they dictate what happens every frame and what to do with events. This allows for having many different implementations for what will happen in your program that fit in with the Display class.

Activity is a abstract class, so an implementation of it needs to be created in your program. Activities have three methods that can be implemented, as shown below:

```D
import d2d;

class MyActivity : Activity {

    this(Display container) {
        super(container); //Default constructor takes in a Display object, stored as 'container'
    }

    void handleEvent(SDL_Event event) { //This method runs whenever there is an event in the display
    }

    override void draw() { //This method runs every frame while the display is running
    }

    override void update() { //This method also runs every frame; useful for differentiating display based and logic based functions
    }

}
```

Note that handleEvent does not need to be overridden, as it is a method implemented by the base Activity class from the EventHandler interface. 

Activities also contain a list of components, which will be discussed in more depth in future tutorials.

Lastly, Activities need to be assigned to the display, which can be done like so:

```D
Display display = new Display(640, 480);
display.activity = new MyActivity(display);
```

After `Display.run()` is called, the `draw()`, `update()`, and `handleEvent()` methods will automatically be called when necessary. For this tutorial, we will only be using the `draw()` method.

## Drawing

Drawing uses the Renderer object, which is automatically created by the Display. The Display can be easily accessed inside an Activity by using `Activity.container`, and from that the renderer can be accessed by using `Activity.container.renderer`. Renderers draw and fill various shapes, using the `draw()` and `fill()` methods. These methods draw different things based on the arguments supplied. Currently, d2d supports drawing the following:

|Shape|Overloads|Description|
|-|-|-|
|Point|int, int; iVector|A single pixel on the screen; can only by done with `draw()`|
|Line|iVector, iVector; iSegment|A line going between two points; can only be done with `draw()`|
|Rectangle|iRectangle|A rectangle, whose sides are alligned with the x and y axes|
|Bezier Curve|Templated numPoints (optional, used with draw!numPoints(args)), BezierCurve(int, 2)|A bezier curve (curve connecting points); can only be done with `draw()`|
|Polygon|Templated numSides (draw/fill!numSides(args), iPolygon!numSides|A polygon with numSides sides|
|Ellipse|Templated numPoints, double startAngle, double endAngle|An ellipse; limited angle draws pie-shaped ellipses|

These methods make use of the d2d objects Vectors, Rectangles, Segments, Bezier Curves, and Polygons. We will go into more depth on these objects in future tutorials, but for now, know that each have aliases denoting what datatype they use. In graphics, integers will always be used. The aliases iVector, iRectangle, iSegment, and iPolygon are what will be used. Below is a table of all of the basic objects that will be used in 2d graphics:

|Object|Constructor Parameters|Description|
|-|-|-|
|iVector|int x, int y|A vector which can represent a point and a distance.|
|iSegment|iVector initial, iVector terminal|An object representing a segment between two points.|
|iRectangle|int x, int y, int width, int height|An object with a location and width and height.|
|iPolygon!T|iVector[T] vertices|A two dimensional object enclosed by T sides.|
|BezierCurve(int, 2)|iVector[]|A list of points representing a bezier curve|

Additionally, each of the draw and fill methods can be passed a color, else they will use the renderer's color. The renderer's color can be set by using the property `drawColor`: `renderer.drawColor = Color(r, g, b, a);`.

d2d comes with a set of predefined colors, under the enumeration PredefinedColor. Colors available are RED, GREEN, BLUE, YELLOW, MAGENTA, CYAN, WHITE, PINK, ORANGE, LIGHTGREY, DARKGREY, and BLACK, and can be accessed by using PredefinedColor.<COLORNAME>.

## Conclusion

Now that you have all of this information available, try to draw something yourself. If you get confused, refer to the example code provided for this tutorial. The next tutorial will discuss event handling in d2d.

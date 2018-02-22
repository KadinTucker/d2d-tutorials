module MainScreen;

import d2d;

/**
 * The screen on which to draw some shapes
 */
class MainScreen : Screen {

    /**
     * Constructs a new MainScreen, contained by the given display
     */
    this(Display container) {
        super(container);
    }

    /**
     * Handles any events while this screen is active
     */
    void handleEvent(SDL_Event event) {
    }

    /**
     * Draws all parts of the screen
     */
    override void draw() {
        this.container.renderer.clear(PredefinedColor.LIGHTGREY);
        this.container.renderer.drawLine(new iVector(500, 100), new iVector(550, 200), PredefinedColor.RED);
        this.container.renderer.drawRect(new iRectangle(100, 150, 50, 100), PredefinedColor.BLUE);
        this.container.renderer.fillRect(new iRectangle(300, 200, 100, 150), PredefinedColor.ORANGE);
        this.container.renderer.drawColor = Color(150, 100, 25);
        this.container.renderer.drawLine(new iSegment(new iVector(500, 300), new iVector(550, 350)));
        this.container.renderer.drawPolygon!3(new iPolygon!3(new iVector(100, 400), new iVector(200, 400), new iVector(150, 485)));
        this.container.renderer.drawColor = Color(100, 25, 25);
        this.container.renderer.fillPolygon!3(new iPolygon!3(new iVector(200, 400), new iVector(300, 400), new iVector(250, 485)));
    }

    /**
     * What the screen does every frame
     */
    override void onFrame() {
    }

}
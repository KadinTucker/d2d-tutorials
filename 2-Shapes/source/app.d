module app;

import d2d;
import MainScreen;

void main() {
	Display display = new Display(800, 600, SDL_WINDOW_SHOWN, 0, "Shapes Playground", null);
	display.screen = new MainScreen(display);
	display.run();
}

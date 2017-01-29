import Sdl.*;
import Sdl.SDL_Window;
import Sdl.SDL_Renderer;
import Sdl.SDL_Event;
import cpp.RawPointer;

class Main {
    static function main() {
        SDL_Init(SDL_INIT_VIDEO);
        SDL_SetMainReady();

        var win:RawPointer<SDL_Window> = null;
        var ren:RawPointer<SDL_Renderer> = null;
        SDL_CreateWindowAndRenderer(800, 600, 0, RawPointer.addressOf(win), RawPointer.addressOf(ren));

        var done = false;
        while (!done) {
            var event:SDL_Event = untyped __cpp__("SDL_Event()");
            while (SDL_PollEvent(RawPointer.addressOf(event)) != 0) {
                switch (event.type) {
                    case Sdl.SDL_QUIT:
                        done = true;
                    case Sdl.SDL_KEYDOWN if (event.key.keysym.sym == SDLK_ESCAPE):
                        done = true;
                    case Sdl.SDL_DROPFILE:
                        trace(event.drop.file);
                    default:
                }
            }
            SDL_RenderPresent(ren);
        }

        SDL_Quit();
    }
}

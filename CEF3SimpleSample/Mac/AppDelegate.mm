
#import "AppDelegate.h"

#include "include/cef_app.h"
#include "include/cef_browser.h"

#include "ClientApp.h"
#include "ClientHandler.h"

@implementation AppDelegate

@synthesize window;

-(void)dealloc
{
    [super dealloc];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed: (NSApplication *)sender
{
    return YES;
}

-(void)applicationDidFinishLaunching: (NSNotification *)aNotification
{
    CefMainArgs main_args;

    CefRefPtr<ClientApp> app(new ClientApp);

    // Execute the secondary process, if any.
    int exit_code = CefExecuteProcess( main_args, app.get() );
    if ( exit_code >= 0 ) {
        exit(exit_code);
    }

    char cwd[1024];
    getcwd( cwd, sizeof(cwd) );

    CefSettings settings;

    CefInitialize( main_args, settings, app.get() );

    CefWindowInfo        info;
    CefBrowserSettings   b_settings;
    CefRefPtr<CefClient> client(new ClientHandler);

    std::string path;

    CefRefPtr<CefCommandLine> command_line = CefCommandLine::GetGlobalCommandLine();
    if ( command_line->HasSwitch("url") ) {
        path = command_line->GetSwitchValue("url");
    }

    if ( path.empty() ) {
        path = [[[NSBundle mainBundle] resourcePath] cStringUsingEncoding:NSUTF8StringEncoding];
        path = "file://" + path + "/html/index.html";
    }

    info.SetAsChild([window contentView], 0, 0, [[window contentView] frame].size.width, [[window contentView] frame].size.height);
    CefBrowserHost::CreateBrowser(info, client.get(), path, b_settings);

    CefRunMessageLoop();
    CefShutdown();
}

@end

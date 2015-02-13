
#include "include/cef_app.h"

#include "ClientApp.h"

int main(int argc, char *argv[])
{
    CefMainArgs main_args(argc, argv);

    CefRefPtr<ClientApp> app(new ClientApp);
    return CefExecuteProcess( main_args, app.get() );
}

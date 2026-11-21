const vscode = require('vscode');
const { spawn } = require('child_process');

function hello() {
    vscode.window.showInformationMessage('bcx/hello');
}

class BcxViewProvider {
    resolveWebviewView(webviewView) {
        // webviewView.webview.options = { enableScripts: true };
        webviewView.webview.html = `
<pre>
Cp:0000
Ip:0000
M[]
R[]
D[]
</pre>
        `;
    }
}

function activate(context) {
    // сообщение в консоль разработчика
    console.log('bcx: activate');
    // сообщение пользователю в правом нижнем углу
    vscode.window.showInformationMessage('bcx: activate');

    // добавить команду, которую пользователь сможет вызвать вручную
    let disposable = vscode.commands.registerCommand('bcx.hello', () => {
        vscode.window.showInformationMessage('bcx.hello');
    });
    context.subscriptions.push(disposable);
    context.subscriptions.push(
        vscode.window.registerWebviewViewProvider(
            'bcx.explorer',
            new BcxViewProvider()
        )
    );

    // регистрация кастомного типа отладчика
    vscode.debug.registerDebugAdapterDescriptorFactory('bcx', {
        async createDebugAdapterDescriptor(session) {
            const program = session.configuration.program;
            const child = spawn(program, [], {
                stdio: ['ignore', 'pipe', 'pipe']
            });

            await new Promise(r => setTimeout(r, 500));

            const host = session.configuration.serverHost || '127.0.0.1';
            const port = session.configuration.serverPort || 4711;
            return new vscode.DebugAdapterServer(port, host);
        }
    });
}

function deactivate(context) {
    console.log('bcx: deactivate');
}

module.exports = { activate, deactivate };

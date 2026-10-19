const vscode = require('vscode');

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
            new BcxViewProvider
        )
    );
}

function deactivate(context) {
    console.log('bcx: deactivate');
}

module.exports = { activate, deactivate };

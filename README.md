-Introdução flutter
    -Nativo x Multiplataforma
        -Nativo:
            -Android:
                -IDE: Android Studio
                -SDK: Android SDK
                -Linguagens : Kotlin / Java
                -Plataformas: Win / Linux / Mac
            -IOS:
                -IDE:Xcode
                -SDK: Cocoa Touch
                -Linguagens: Swift / ObjC
                -Plataformas: Mac
        -Multiplataforma:
            -React Native:
                -Linguagem: JavaScript
                -Tipos Softwares: Android/Ios/Web
                -Resultado: Nativo()
            -Flutter:
                -Linguagem:Dart
                -Tipos Softwares:Android/Ios/Web/Linux/Win/Mac
                -Resultado: Nativos()
            -Ionic:
                Lingugem:JavaScript
                Tipos Softwares: Android/Ios/Web
                Resultado: Emulado(Runtime)

    -Configuração do Ambiente de Desenvolvimento
    -Estrutura de um Aplicativo Flutter
        -Interfaces Linhas de comando (cli)
            -flutter create - criar workspaces(projetos)
            "flutter create --empty" - app padrão (Hello World);
            "flutter create --platforms=android"
            "flutter create --template=packje"
                escolher a plataforma de desenvolvimento
        Exemplo de uso:
        flutter create --platforms=android --empty nome_app(nome não pode conter caractéres especiais ~,^,`,´,ç).
            "flutter create --template=modules
            -flutter run
            --verbose
                "flutter run -v"

            -flutter pug get( atualização dos pacotes)
            -flutter upgrade - atualiza a versão do flutter
            -flutter downgrade - volta para a versão anterior
            -flutter doctor - verifica as disponibilidade de uso
            
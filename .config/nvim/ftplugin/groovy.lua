require('lspconfig').groovyls.setup {
    cmd = { 'java', '-jar', '/home/xavier/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar', '>', '/tmp/groovyls.log' },
    settings = {
        groovy = {
            classpath = {
                "/home/xavier/Apps/groovy-4.0.19/lib",
                "/usr/lib/jvm/java-17-openjdk-amd64/lib",
                "/home/xavier/dev/demols/javagradle/app/build/classes/java/main/org/example/App.class",
            }
        }
    }
}

// sessão

// Função para validar a sessão do usuário
function validarSessao() {
    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    var usuario = document.getElementById("usuario");

    if (email && nome) {
        if (usuario) {
            usuario.innerHTML = nome;
        }
    } else {
        window.location.href = "../login.html";
    }
}


function limparSessao() {
    sessionStorage.clear();
    window.location.href = "../login.html";
}
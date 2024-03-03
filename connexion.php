<?php
include_once("layout/header.php");
?>
<div class="container">
    <div class="row mt-5">
        <div class="col-lg-4 bg-white m-auto rounded-top">
            <h2 class="text-center"> Connexion </h2>
            <p class="text-center text-muted load"> Connectez vous !</p>
            <form action="">
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="fa fa-envelope"></i> </span>
                    <input type="text" class="form-control" placeholder="E-mail">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="fa fa-lock"></i> </span>
                    <input type="text" class="form-control" placeholder="Mot de passe">
                </div>
                <div class="d-grid">
                    <button type="button" class="btn btn-success"> se connecter</button>
                    <p class="text-center"> Vous n'avez pas de compte? <a href="Inscription.html"> S'inscrire </a> </p>

                </div>
            </form>
        </div>
    </div>
</div>
<?php
include_once("layout/footer.php");
?>
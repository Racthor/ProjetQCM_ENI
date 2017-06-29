<section id="content">
	<div class="container">
		<div class="row">
			<% if(request.getAttribute("erreur") != null) {%>
			<div class="col-md-10 col-md-offset-1 alert alert-danger" role="alert">Erreur lors de la connexion.<br/>Votre login ou mot de passe est incorrect.</div>
			<%}%>
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		    
<!-- 		<form action="Connexion" method="post"> -->
<!-- 			Login : <input type="textArea" name="login"></input><br/> -->
<!-- 			Password : <input type="textArea" name="password"></input><br/> -->
<!-- 			<input type="submit" value="Valider" name="validation"/> -->
<!-- 		</form> -->
		    
				<form role="form" class="register-form" action="Connexion" method="post">
					<h2>Connexion </h2>
					<hr class="colorgraph">
					<div class="form-group">
						<input type="email" name="login" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4">
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control input-lg" id="exampleInputPassword1" placeholder="Password" tabindex="5">
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-3 col-md-3">
							<span class="button-checkbox">
								<button type="button" class="btn" data-color="info" tabindex="6">Se souvenir de moi</button>
		                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
							</span>
						</div>
					</div>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<input type="submit" value="Connexion" class="btn btn-primary btn-block btn-lg" tabindex="7">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@page import="java.util.Set"%>
<%@page import="fr.eni.ecole.projetqcm.bean.Test"%>
<%@page import="fr.eni.ecole.projetqcm.bean.EnsembleTests"%>
<%@ include file="../General/head.jsp" %>
<%@ include file="../General/header.jsp" %>
<jsp:useBean id="ensembleTests" class="fr.eni.ecole.projetqcm.bean.EnsembleTests"></jsp:useBean>
<!-- form-control -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
				    <div class="col-xs-12 col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
						<h2>Liste des test existant</h2>
						<div class="panel panel-default">
  							<div class="panel-heading">Panel heading without title</div>
								<%for (Test t : (Set<Test>)request.getAttribute("ensembleTests")) {%>
								<div class="panel-body">
									<%= t.getNom() %>
								</div>
								<%} %>
							</div>
							<h3>Suprression, modification du test</h3>
						<h2>Ajout d'un test : go formulaire</h2>
						<form role="form" class="register-form" action="saveTest" method="post">
							<h2>Gestion d'un test</h2>
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
		</div>
	</div>
<%@ include file="../General/footer.jsp" %>
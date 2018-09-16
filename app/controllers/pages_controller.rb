class PagesController < ApplicationController

	def messagerie
		@allMessages = Message.where(id_destinataire: current_user.id).reverse
	end

	def newmessage
	end

	def postmessage
		@allMessages = Message.all

		path = 0

		if(User.where(username: params[:dest]).ids.first == nil)
			redirect_to '/newmessage'
			path = 1
		else
			if (path == 0)
				id_dest = User.where(username: params[:dest]).ids.first
				contenu = params[:message]
				id_auteur = current_user.id
				Message.create id_auteur: id_auteur, id_destinataire: id_dest, contenu: contenu, date: Time.now
				redirect_to '/messagerie'
			end
		end
	end

	def show
		@activeMessage = Message.find(params[:id])
	end

	def compte
		@user = User.find(current_user.id)
	end

	def publications
    @allPublications = Publication.where(auteur_id: current_user.id).reverse
  end
  def create
  	@connectedUser = User.find(current_user.id)
  	Publication.create auteur_id: current_user.id, auteur: current_user.username, titre: params[:titre], contenu: params[:contenu], date: Time.now, likes: 0

  	@connectedUser.xp += 15
	@connectedUser.save

  	redirect_to "/publications"
  end
  def destroy
  	@publication_actuelle = Publication.find(params[:id_publication])
  	@publication_actuelle.destroy

  	@connectedUser = User.find(current_user.id)

  	@connectedUser.xp -= 15
	@connectedUser.save

  	redirect_to "/publications"
  end
  def destroyWithProfile
  	@publication_actuelle = Publication.find(params[:id_publication])
  	@publication_actuelle.destroy

  	@connectedUser = User.find(current_user.id)

  	@connectedUser.xp -= 15
	@connectedUser.save

  	redirect_to "/users/#{current_user.id}"
  end
  def acceuil
  	@allPublications = Publication.all.reverse
		if current_user
			@allFollows = Follow.where(id_follower: current_user.id)
			@followCibles = []
			@allPublicationsCible = []
			@allFollows.each do |un_follow|
				@followCibles.push(un_follow.id_followed)
			end
			@allPublications.each do |une_publication|
				if @followCibles.index une_publication.auteur_id
					@allPublicationsCible << une_publication
				end
			end
	    @allPublicationsCible = @allPublicationsCible.reverse
		end
  end
  def profile
  	@user = User.find(params[:id])
  	@allPublications = Publication.where(auteur_id: params[:id]).reverse
		@userRecommende = []
		@allUser = User.all
		@allUser.each do |un_user|

		end

  	@followeds = Follow.where(id_followed: params[:id])
  	@followers = Follow.where(id_follower: params[:id])
  end
  def follow
  end
  def discover
  	@allPublications = Publication.all.reverse
	end
	def recherche
		if params[:recherche] != nil
			@allPublications = Publication.all
			@allUsers = User.all
			@retourFinal = []
			@allPublications.each do |une_publication|
				if une_publication.titre[params[:recherche]] != nil
					@retourFinal.push(une_publication)
				end
			end
			@allUsers.each do |un_user|
				if un_user.username[params[:recherche]] != nil || un_user.prenom[params[:recherche]] != nil || un_user.nom[params[:recherche]] != nil ||  un_user.email[params[:recherche]] != nil
					@retourFinal.push(un_user)
				end
			end
			@retourFinal = @retourFinal.shuffle
			@recherche = params[:recherche]
		end
	end

	def follow
		wantFollowUser = User.find(current_user.id)
		toFollowUser = User.find(params[:id])

		isFollowing = Follow.where(id_follower: wantFollowUser.id, id_followed: toFollowUser.id).length
		Follow.create id_follower: wantFollowUser.id, id_followed: toFollowUser.id

		wantFollowUser.xp += 10
		wantFollowUser.save

		redirect_to '/users/' + params[:id]
	end
	def unfollow
		wantFollowUser2 = User.find(current_user.id)
		toFollowUser2 = User.find(params[:id])

		unfollowQuery = Follow.where(id_follower: wantFollowUser2.id, id_followed: toFollowUser2.id).ids.first
		Follow.destroy(unfollowQuery)

		wantFollowUser2.xp -= 10
		wantFollowUser2.save

		redirect_to '/users/' + params[:id]
	end

	def sent_messages
		@allMessages = Message.where(id_auteur: current_user.id).reverse
	end
	def newtchat
  	Tchat.create auteur_id: current_user.id, auteur: current_user.username, contenu: params[:contenu]
	end
	def tchat
  	@allTchat = Tchat.all
	end
	def top
		@allUser = User.all
		@allUserXp = []
		@allUserTrie = []
		@allUser.each do |un_user|
			@allUserXp.push(un_user.xp)
		end
		@allUserXp = @allUserXp.sort.reverse
		countIteration = 0
		if (@allUser.length > 20)
		  maxIteration = 20
		else
		  maxIteration = @allUser.length
		end
		while countIteration < maxIteration
			@allUser.each do |un_user|
				if un_user.xp == @allUserXp[countIteration]
					@allUserTrie.push(un_user)
					countIteration += 1
				end
			end
		end
	end
end

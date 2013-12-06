module RecipesHelper
 
 def videoConversion(video)
   video = video.sub(video[15..17], "100%")
   video = video.sub(video[28..30], "100%")
   video
 end
 
end

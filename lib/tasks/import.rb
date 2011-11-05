namespace :crowdlobbying do
 
  task :import_members do
    
    @members = Hpricot.parse( open('http://data.parliament.uk/resources/members/api/commons/') )
               
    
  end
 
end
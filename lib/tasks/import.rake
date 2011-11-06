namespace :import do
                                                                                                
  desc "import members into the database"
  task :members => :environment do                       
    require 'open-uri'
       
    @members = []                          
    MEMBERS_URL = 'http://data.parliament.uk/resources/members/api/commons/'
                                
    puts "Loading MP list from #{MEMBERS_URL}\n"
    puts "-----------\n"
    
    doc = Hpricot.parse( open( MEMBERS_URL ) )    
    
    count = (doc/"m:commonsmember").length
    i = 1           
                                             
    success_count = 0
    failed_count = 0
    
    (doc/"m:commonsmember").each do |member|        
                                          
      print "[#{i}/#{count}] Loading " + (member/"m:firstname").innerHTML + " " + (member/"m:lastname").innerHTML + "... "
      i += 1                                      
      
      member_id = member['m:id']
      biography_url = "http://data.parliament.uk/resources/members/api/biography/" + member_id + "/"
      
      biography = Hpricot.parse( open(biography_url) ) rescue nil

      unless biography.nil?             
        
        emails = []
        (biography/"biography:email").each do |e|
          e = e.innerHTML.split('; ')
          emails += e
        end          
                                            
        data = {
          :first_name => (member/"m:firstname").innerHTML,
          :last_name => (member/"m:lastname").innerHTML,
          :constituency => (member/"c:constituencyname").innerHTML,
          :party => (member/"p:partyname").innerHTML,   
          :party_abbr => (member/"p:partyabbrev").innerHTML,                         
          :phone => (biography/"biography:phone").first.innerHTML,
          :email => emails.join(';;'),
          :photo_url => (biography/"biography:lowresphoto").innerHTML
        }

        print "Done! \n".colorize( :green )      
        success_count += 1
                                 
        @members << data  
      
      else
         
        print "Failed \n".colorize( :red ) 
        failed_count += 1
        
      end                           
      
    end               
    
    puts "Loaded #{@members.size} members from the API."                    
    puts "#{success_count} success, #{failed_count} failed."                              
    
    i = 1                           
    success_count = 0
    failed_count = 0
        
    @members.each do |m|
      print "[#{i}/#{@members.size}] Saving #{m[:first_name]} #{m[:last_name]} to database... "
      
      member_model = Member.new( 
        :first_name => m[:first_name],
        :last_name => m[:last_name], 
        :constituency => m[:constituency], 
        :telephone => m[:phone], 
        :email => m[:email], 
        :photo_url => m[:photo_url]
      )
      
      conditions = {
        :name => m[:party],
        :abbr => m[:party_abbr]
      }
      member_model.party = Party.find( :first, :conditions => conditions ) || Party.create( conditions )
      
      if member_model.save
        print "Done! \n".colorize( :green ) 
        success_count += 1 
      else
        print "Failed \n".colorize( :red )  
        failed_count += 1 
      end
           
      i += 1
    end       
    
    puts "#{success_count} success, #{failed_count} failed."  
    
  end
 
end
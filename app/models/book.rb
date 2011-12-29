class Book < ActiveRecord::Base
 
 validates_presence_of     :BookID,:Subject,:Title,:Author,:Publisher,:Copyright,:Edition,:Pages,:ISBN,:NumberOfBooks,:Library
 validates_uniqueness_of   :BookID
 validates_numericality_of :NumberOfBooks,:Edition,:Pages

end

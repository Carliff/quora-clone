class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :answers
	has_many :votes, as: :voteable
end

def total_votes
	self.up_votes + self.down_votes
end

def ranking_votes
	self.up_votes - self.down_votes
end

def up_votes
	self.votes.where(vote: true).size
end

def down_votes
	self.votes.where(vote: false).size
end
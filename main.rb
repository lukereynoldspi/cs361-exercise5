# Exercise 6

class LaunchDiscussionWorkflow

  def initialize(discussion, host, participants_email_string)
    @discussion = discussion
    @host = host
    @participants_email_string = participants_email_string
    @participants = []
  end

  def run
    return unless valid?
    run_callbacks(:create) do
      ActiveRecord::Base.transaction do
        discussion.save!
        create_discussion_roles!
        @successful = true
      end
    end
  end

class GenerateParticipantUser
  def generate_participant_email
    return if @participants_email_string.blank?
    @participants_email_string.split.uniq.map do |email_address|
      User.create(email: email_address.downcase, password: Devise.friendly_token)
    end
  end

end
class TestLaunchDiscussionWorkflow < Test::Unit::TestCase

  def test_run
  end

  def test_initialize
    user = GenerateParticipantUser.new
    workflow = LaunchDiscussionWorkflow.new
    
  end

class TestGenerateParticipantUser < Test::Unit::TestCase
  def test_generate_participant_email
  end
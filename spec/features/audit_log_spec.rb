require 'rails_helper' 

describe 'AuditLog Feature' do

  describe 'index' do
    before do
      admin_user = FactoryGirl.create(:admin)
      login_as(admin_user, :scope => :user)
      FactoryGirl.create(:audit_log)
    end
    it 'has an index page that can be reach' do
        visit audit_logs_path
        expect(page.status_code).to eq(200)
    end
    it 'renders audit log content' do
        visit audit_logs_path
        expect(page).to have_content(/Snow, John/)
    end
    xit 'can not be access for non admin users' do
        
    end
  end
end
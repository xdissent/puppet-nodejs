require "spec_helper"

describe "nodejs::v0_10" do
  let(:facts) { default_test_facts }

  it do
    should include_class("nodejs::v0_10_22")

    should contain_file("/test/boxen/nodenv/versions/v0.10").with({
      :ensure => "link",
      :target => "/test/boxen/nodenv/versions/v0.10.22"
    })
  end
end

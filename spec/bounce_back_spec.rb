require 'spec_helper'

describe BounceBack do
  it 'has a version number' do
    expect(BounceBack::VERSION).not_to be nil
  end

  it 'email should return valid' do 
  	output = BounceBack.check_email('oscar.vazquez2012@gmail.com')
  	expect(output).to eq(true)
  end

  it 'email should return invalid' do 
  	output = BounceBack.check_email('oscar.vazquez2012gmail.com')
  	expect(output).to eq(false)
  end
  
  it 'email should return invalid' do 
  	output = BounceBack.check_email('oscar.vazquez2012gmailcom')
  	expect(output).to eq(false)
  end

  it 'yes special it should return invalid' do 
  	output = BounceBack.no_special('@/`39idja;;`')
  	expect(output).to eq(false)
  end

  it 'yes special it should return invalid' do 
  	output = BounceBack.no_special('oscar123')
  	expect(output).to eq(true)
  end

  it 'should escape special characters if they exist' do
  	output = BounceBack.escape_special('381!*#&!(./')
  	expect(output).to eq("381!\\*#&!(\\.\\/")
  end

  it 'should return false because passwords are different' do 
  	output = BounceBack.pass_the_same('oscar', 'gustavo')
  	expect(output).to eq(false)
  end

  it 'should return true because passwords are the same' do 
  	output = BounceBack.pass_the_same('oscar', 'oscar')
  	expect(output).to eq(true)
  end

end

require_relative '../classes/music_album'

describe MusicAlbum do
  context 'Test for the Music album class' do
    before(:each) do
      @album = MusicAlbum.new('2020/11/10', false, true)
    end

    it 'should check for an instance of MusicAlbum' do
      expect(@album).to be_an_instance_of(MusicAlbum)
    end
  end
end

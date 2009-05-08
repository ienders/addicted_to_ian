xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title('addictedTOian: Words')
    xml.link(url_for(:only_path => false, :controller => 'blogs', :action => 'rss'))
    xml.description('From the mouth of Ian Enders: Software Engineer, Web Developer and Comic Nerd')
    @blogs.each do |blog|
      xml.item do
        xml.title(blog.title)
        xml.link(blog_path(blog))
        xml.description(markdown(truncate(blog.content, 650)))
        xml.pubDate(blog.created_at.to_s(:rfc822))
        xml.guid(blog_path(blog))
      end
    end
  end
end
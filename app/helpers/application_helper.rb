module ApplicationHelper

  ALERTS = {alert: 'danger', notice: 'primary'}

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message
    flash.map do |key, message|
      alert = ALERTS[key.to_sym]
      content_tag :p, message.html_safe, class: "alert alert-#{alert}"
    end.join().html_safe
  end

  def gist_hash(gist)
    gist.gist_url.split('/').last
  end
end



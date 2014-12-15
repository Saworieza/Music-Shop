crumb :root do
  link "Music shop" + (Time.now.monday? ? " (SALES!)" : '')#shows on mondays only
  link "Home", root_path
end

crumb :album do |album|
	link album.title, album
	parent :root
end
crumb :edit_album do |album|
  link "Edit #{album.title}", album
  parent :album, album
end
crumb :user do
  link "#{current_user}'s profile"
end

crumb :admin_root do
  link "Admin's area"
  parent :root
end
 
crumb :user do
  link "#{current_user}'s profile"
  if admin?
    parent :admin_root
  else
    parent :root
  end
end

crumb :search do |keyword|
  link "Searching for #{keyword}", search_path(q: keyword)
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
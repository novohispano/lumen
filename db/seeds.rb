User.create(email: 'novohispano@gmail.com', password: 'password', password_confirmation: 'password')

4.times do |i|
  i += 1

  if i > 3
    highlight = Highlight.create!(
      title:        "Historia",
      description:  'No mei dicam oportere. Ex ferri apeirian vis, pri dicit maiorum copiosae ut, te cum augue vituperatoribus. Quis deseruisse ius ad, illud vidisse usu no. Ex habeo affert graeci eam, eum dictas facilis antiopam te, ius lucilius lobortis et. Sit eu offendit delicata, est ad homero feugiat, nec ut sint dolorum utroque.',
      content_type: 'history'
    )
  else
    highlight = Highlight.create!(
      title:        "Highlight #{i}",
      description:  'No mei dicam oportere. Ex ferri apeirian vis, pri dicit maiorum copiosae ut, te cum augue vituperatoribus. Quis deseruisse ius ad, illud vidisse usu no. Ex habeo affert graeci eam, eum dictas facilis antiopam te, ius lucilius lobortis et. Sit eu offendit delicata, est ad homero feugiat, nec ut sint dolorum utroque.',
      content_type: 'metric'
    )
  end
end

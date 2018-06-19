def circle_area(radius)
  # Given a radius, returns the circle area
  if radius < 0
    return 0
  else
    return 3.14 * (radius**2)
  end
end

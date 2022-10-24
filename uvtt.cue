#point: {
  x: number
  y: number
}

#bounded_point: #point & {
  _max_x: number
  _max_y: number
  x: >=0 & <=_max_x
  y: >=0 & <=_max_y
}

#dimensions: {
  x: number
  y: number
}

#resolution: {
  map_origin: #point
  map_size: #dimensions
  pixels_per_grid: int & >=1
}

#portal: {
  position: #point
  bounds: [...#point]
  rotation: number
  closed: bool
  freestanding: bool
}

#rgb_string: =~"^[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$"

#environment: {
  baked_lighting: bool
  ambient_light?: #rgb_string
}

#light: {
  position: #point
  range: number
  intensity: number
  color: #rgb_string
  shadows: bool
}

#uvtt: {
  _point_bounds: { _max_x: resolution.map_size.x, _max_y: resolution.map_size.y }
  format: number & >0
  resolution: #resolution
  line_of_sight: [...[...#bounded_point & _point_bounds]]
  objects_line_of_sight: [...[...#bounded_point & _point_bounds]]
  portals: [...#portal & { position: #bounded_point & _point_bounds }]
  environment: #environment
  lights: [...#light & { position: #bounded_point & _point_bounds }]
  image: string
  ...
}

#point: {
  x: number
  y: number
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

#environment: {
  baked_lighting: bool
  ambient_light?: string
}

#light: {
  position: #point
  range: number
  intensity: number
  color: string
  shadows: bool
}

#uvtt: {
  format: number & >0
  resolution: #resolution
  line_of_sight: [...[...#point]]
  portals: [...#portal]
  environment: #environment
  lights: [...#light]
  image: string
  ...
}

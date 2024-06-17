local baseImage = assets.image("/cinematics/pat_crazyring/default.png")

for _, speciesPath in pairs(assets.byExtension("species")) do
  local species = assets.json(speciesPath)

  if species.effectDirectives then
    local imagePath = string.format("/cinematics/pat_crazyring/sustained/%s.png", species.kind)

    if #assets.scan(imagePath) == 0 then
      local image = baseImage:process(species.effectDirectives)
      assets.add(imagePath, image)

      sb.logInfo("Generated %s", imagePath)
    end
  end
end

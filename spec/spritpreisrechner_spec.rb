RSpec.describe Spritpreisrechner do
  it 'has a version number' do
    expect(Spritpreisrechner::VERSION).not_to be nil
  end

  it 'returns stations by_address' do
    lat = 48.2081743
    lng = 16.37381890000006
    stations = Spritpreisrechner::Station.by_address(lat: lat, lng: lng, fuel_type: 'DIE')
    expect(stations.any?).to eq(true)
    stations = Spritpreisrechner::Station.by_address(lat: lat, lng: lng, fuel_type: 'SUP')
    expect(stations.any?).to eq(true)
    stations = Spritpreisrechner::Station.by_address(lat: lat, lng: lng, fuel_type: 'GAS')
    expect(stations.any?).to eq(true)
  end

  it 'returns stations by_region' do
    code = 1
    region_type = 'BL'
    stations = Spritpreisrechner::Station.by_region(code: code, region_type: region_type, fuel_type: 'DIE')
    expect(stations.any?).to eq(true)
    stations = Spritpreisrechner::Station.by_region(code: code, region_type: region_type, fuel_type: 'SUP')
    expect(stations.any?).to eq(true)
    stations = Spritpreisrechner::Station.by_region(code: code, region_type: region_type, fuel_type: 'GAS')
    expect(stations.any?).to eq(true)
  end

  it 'returns coordinate errors from Station#by_address' do
    lat = nil
    lng = nil
    fuel_type = 'DIE'
    stations = Spritpreisrechner::Station.by_address(lat: lat, lng: lng, fuel_type: fuel_type)
    expect(stations.any?).to eq(false)
    expect(stations.errors[0]).to eq('you need to submit a valid latitude coordinate')
    expect(stations.errors[1]).to eq('you need to submit a valid longitude coordinate')
    expect(stations.errors.count).to eq(2)
  end

  it 'returns parameter errors from Station#by_region' do
    code = nil
    region_type = nil
    fuel_type = 'DIE'
    stations = Spritpreisrechner::Station.by_region(code: code, region_type: region_type, fuel_type: fuel_type)
    expect(stations.any?).to eq(false)
    expect(stations.errors[0]).to eq('you need to submit a valid region code')
    expect(stations.errors[1]).to eq('you need to submit a valid region type. The options are ["BL", "PB"]')
    expect(stations.errors.count).to eq(2)
  end

  it 'returns regions' do
    regions = Spritpreisrechner::Region.all
    expect(regions.any?).to eq(true)
  end

  it 'finds a region by id' do
    region = Spritpreisrechner::Region.find(1)
    expect(region.nil?).to eq(false)
    expect(region.code).to eq(1)
  end

end

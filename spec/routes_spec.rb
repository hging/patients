require "rails_helper"

RSpec.describe "routes for Widgets", :type => :routing do

  it {expect(get("/")).to route_to("patients#index")}

  it "route /locations/1/patients to the patients controller " do
    expect(get("/locations/1/patients")).
      to route_to(
        :controller => "patients",
        :action => "index",
        :location_id => "1"
      )
  end

  it "route /patients to the patients controller " do
    expect(get("/patients")).
      to route_to(
        :controller => "patients",
        :action => "index"
      )
  end

  it "route /patients/1 to the patients show controller " do
    expect(get("/patients/1")).
      to route_to(
        :controller => "patients",
        :action => "show",
        :id => "1"
      )
  end

  it "route /patients/1/new to the patients new controller " do
    expect(get("/patients/new")).
      to route_to(
        :controller => "patients",
        :action => "new"
      )
  end

  it "route post /patients to the patients create controller " do
    expect(post("/patients")).
      to route_to(
        :controller => "patients",
        :action => "create"
      )
  end

  it "route /patients/1/edit to the patients edit controller " do
    expect(get("/patients/1/edit")).
      to route_to(
        :controller => "patients",
        :action => "edit",
        :id => "1"
      )
  end

  it "route patch /patients/1 to the patients update controller " do
    expect(patch("/patients/1")).
      to route_to(
        :controller => "patients",
        :action => "update",
        :id => "1"
      )
  end

  it "route delete /patients/1 to the patients destroy controller " do
    expect(delete("/patients/1")).
      to route_to(
        :controller => "patients",
        :action => "destroy",
        :id => "1"
      )
  end


end

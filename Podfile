# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

target 'Workout' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Workout
 pod 'RealmSwift', '~>10.34.0'
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'Realm'
      create_symlink_phase = target.shell_script_build_phases.find { |x| x.name == 'Create Symlinks to Header Folders' }
      create_symlink_phase.always_out_of_date = "1"
    end
  end
end

end

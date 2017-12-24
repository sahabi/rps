%Initializing the agents to random positions with barrier certificates 
%and data plotting.  This script shows how to initialize robots to a
%particular point
%Paul Glotfelter 
%3/24/2016

dgrid_size = [4,4];
cgrid_size = [2,2];
xwidth = cgrid_size(1)/dgrid_size(1);
ywidth = cgrid_size(2)/dgrid_size(2);

% Get Robotarium object used to communicate with the robots/simulator
rb = RobotariumBuilder();

% Get the number of available agents from the Robotarium.  We don't need a
% specific value for this algorithm
N = 2;

% Set the number of agents and whether we would like to save data.  Then,
% build the Robotarium simulator object!
r = rb.set_number_of_agents(N).set_save_data(false).build();
obj_next = zeros(15,3);
obj_next(14,:) = [14,10,99];
obj_next(10,:) = [6,10,14];
obj_next(6,:) = [2,6,10];
obj_next(2,:) = [2,6,99];
dest_pose = zeros(3,N);
init = false;
init_dest_0 = d2c(0);
init_dest_1 = d2c(14);
si_barrier_certificate = create_si_barrier_certificate('SafetyRadius', 0.06);
for k = 0:1000000
  si_vel = zeros(2,N);
  x = r.get_poses();
  x_si = x(1:2, :);
  if ~init
    dest_pose(:,1) = init_dest_0;
    dest_pose(:,2) = init_dest_1;
    while(sum(init_checker(x,dest_pose))~=N)
      si_velocities = controller(x(1:2, :), dest_pose(1:2, :));
      si_velocities = si_barrier_certificate(si_velocities, x(1:2, :));
      uni_velocities = si_to_uni_dynamics(si_velocities, x);
      r.set_velocities(1:N, uni_velocities);
      r.step();
    end
    init = true;
  else
    x = r.get_poses();
    x1 = x(1:2,1);
    dest_pose(:,1) = d2c(move(c2d(x1)));
    dest_pose(:,2) = d2c(random.choice(ob_next(c2d(x1))));
  end

  while (sum(init_checker(x,dest_pose))~=N)
      si_velocities = controller(x(1:2, :), dest_pose(1:2, :));
      uni_velocities = si_to_uni_dynamics(si_velocities, x);
      r.set_velocities(1:N, uni_velocities);
      r.step();
  end
end

% We'll make the rotation error huge so that the initialization checker
% doesn't care about it
%args = {'PositionError', 0.01, 'RotationError', 50};
%init_checker = create_is_initialized(args{:});
%controller = create_si_position_controller();

%while(~init_checker(x, initial_conditions))

%    x = r.get_poses();
%    dxi = controller(x(1:2, :), initial_conditions(1:2, :));
%    dxi = si_barrier_certificate(dxi, x(1:2, :));      
%    dxu = si_to_uni_dynamics(dxi, x);
%
%    r.set_velocities(1:N, dxu);
%    r.step();   
%end

% Though we didn't save any data, we still should call r.call_at_scripts_end() after our
% experiment is over!
r.call_at_scripts_end();



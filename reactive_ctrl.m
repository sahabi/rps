dgrid_size = [4.,4.];
cgrid_size = [2,1.5];
xwidth = cgrid_size(1)/dgrid_size(1);
ywidth = cgrid_size(2)/dgrid_size(2);
N = 2;
obj_next = zeros(15,3);
obj_next(14,:) = [14,10,99];
obj_next(10,:) = [6,10,14];
obj_next(6,:) = [2,6,10];
obj_next(2,:) = [2,6,99];
rb = RobotariumBuilder();
r = rb.set_number_of_agents(N).set_save_data(false).build();
init = false;
init_dest_0 = d2c(0);
init_dest_1 = d2c(14);
si_barrier_certificate = create_si_barrier_certificate('SafetyRadius', 0.06);
dest_pose = zeros(3,N);
args = {'PositionError', 0.01, 'RotationError', 50};
init_checker = create_is_initialized(args{:});
controller = create_si_position_controller();
si_to_uni_dynamics = create_si_to_uni_mapping2();
x = r.get_poses();
for k = 0:1000000
  si_vel = zeros(2,N);
  x_si = x(1:2, :);
  if ~init
    dest_pose(:,1) = init_dest_0;
    dest_pose(:,2) = init_dest_1;
    dest_pose(3,:) = x(3,:);
    while(~init_checker(x,dest_pose))
      si_velocities = controller(x(1:2, :), dest_pose(1:2, :));
      si_velocities = si_barrier_certificate(si_velocities, x(1:2, :));
      uni_velocities = si_to_uni_dynamics(si_velocities, x);
      r.set_velocities(1:N, uni_velocities);
      r.step();
      x = r.get_poses();
      dest_pose(3,:) = x(3,:);
    end
    init = true;
  else
    x1 = x(1:2,2);
    dest_pose(:,1) = d2c(move(c2d(x1)));
    x2 = x(1:2,1);
    rs = randsample(ob_next(c2d(x2)),1);
    dest_pose(:,2) = d2c(rs);
    randsample(ob_next(c2d(x1)),1);
    dest_pose(3,:) = x(3,:);
  end
  while (~init_checker(x,dest_pose))
      si_velocities = controller(x(1:2, :), dest_pose(1:2, :));
      uni_velocities = si_to_uni_dynamics(si_velocities, x);
      r.set_velocities(1:N, uni_velocities);
      r.step();
      x = r.get_poses();
  end
end
r.call_at_scripts_end();



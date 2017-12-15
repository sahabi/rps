import rps.robotarium as robotarium
import rps.utilities.graph as graph
from rps.utilities.controllers import *
import rps.utilities.transformations as transformations
from rps.utilities.misc import at_pose
from rps.utilities.barrier_certificates import *
import numpy as np
from math import floor
import random
from enum import Enum

class Grid(object):
    
    #__slots__ = ["_state", "_table"]
    
    def __init__(self):
        self._state = 36
    
    _table = [ {
        10: (1, 0),
            14: (2, 4),
        },
        {
        10: (1, 0),
            6: (3, 4),
            14: (2, 4),
        },
        {
        10: (4, 8),
            14: (5, 8),
        },
        {
        2: (6, 0),
            10: (4, 8),
            6: (7, 8),
        },
        {
        10: (4, 8),
            6: (8, 12),
            14: (9, 12),
        },
        {
        10: (4, 8),
            14: (9, 12),
        },
        {
        2: (6, 0),
            6: (3, 4),
        },
        {
        2: (10, 8),
            10: (4, 8),
            6: (8, 12),
        },
        {
        2: (11, 13),
            10: (12, 13),
            6: (8, 12),
        },
        {
        10: (12, 13),
            14: (9, 12),
        },
        {
        2: (10, 8),
            6: (7, 8),
        },
        {
        2: (13, 14),
            6: (14, 14),
        },
        {
        10: (12, 13),
            6: (14, 14),
            14: (9, 12),
        },
        {
        2: (15, 10),
            6: (14, 14),
        },
        {
        2: (16, 15),
            10: (12, 13),
            6: (14, 14),
        },
        {
        2: (15, 10),
            6: (14, 14),
        },
        {
        2: (17, 14),
            6: (18, 14),
        },
        {
        2: (19, 10),
            6: (18, 14),
        },
        {
        2: (19, 10),
            10: (20, 13),
            6: (21, 13),
        },
        {
        2: (22, 9),
            6: (18, 14),
        },
        {
        10: (23, 12),
            6: (24, 12),
            14: (25, 12),
        },
        {
        2: (26, 12),
            10: (23, 12),
            6: (24, 12),
        },
        {
        2: (27, 8),
            6: (28, 8),
        },
        {
        10: (29, 8),
            6: (28, 8),
            14: (30, 8),
        },
        {
        2: (27, 8),
            10: (29, 8),
            6: (28, 8),
        },
        {
        10: (29, 8),
            14: (30, 8),
        },
        {
        2: (27, 8),
            6: (28, 8),
        },
        {
        2: (27, 8),
            6: (28, 8),
        },
        {
        2: (27, 8),
            10: (29, 8),
            6: (31, 4),
        },
        {
        10: (29, 8),
            6: (31, 4),
            14: (30, 8),
        },
        {
        10: (29, 8),
            14: (30, 8),
        },
        {
        2: (32, 0),
            10: (33, 0),
            6: (34, 0),
        },
        {
        2: (6, 0),
            6: (35, 0),
        },
        {
        10: (1, 0),
            6: (35, 0),
            14: (0, 0),
        },
        {
        2: (6, 0),
            10: (1, 0),
            6: (35, 0),
        },
        {
        2: (6, 0),
            10: (1, 0),
            6: (3, 4),
        },
        {
        14: (0, 0),
        },
        ]
    
    def move(self, o_state):
        try:
            table = self._table[self._state]
            newState,res = table[o_state]
            self._state = newState
            return res
        
        except IndexError:
            raise Exception("Unrecognized internal state: " + str(self._state))
        
        except Exception:
            self._error(o_state)
    
    def _error(self, o_state):
        raise ValueError("Unrecognized input: " + ( "o_state = {o_state}; ").format( o_state=o_state))


dgrid_size = (4,4)
cgrid_size = (2,2)
xwidth = cgrid_size[0]/dgrid_size[0]
ywidth = cgrid_size[1]/dgrid_size[1]

def c2d(array):
    cx = array[0]
    cy = array[1]
    cx += 1
    dx = floor(cx/xwidth)
    cy += 1
    dy = floor(cy/ywidth)
    s = dx + (dy*dgrid_size[0])
    return s

def d2c(s):
    x = (int(s % dgrid_size[0])*xwidth) + (xwidth/2)
    y = (int(s / dgrid_size[1])*ywidth) + (ywidth/2)
    return np.array([x-1,y-1,0])

def get_init_pose(n):
    init_pose = np.zeros((3, n))
    init_pose[0,:] = [0,1]
    init_pose[1,:] = [0,1]
    init_pose[2,:] = [0,0]
    return init_pose

def main():
    N = 2
    ctrl = Grid()
    ob_next = {14:[14,10],10:[6,10,14],6:[2,6,10],2:[2,6]}
    dests_0, dests_1 = ([],[])
    dest_pose = np.zeros((3, N))
    # Instantiate Robotarium object
    r = robotarium.Robotarium(number_of_agents=N, show_figure=True, save_data=True, update_time=1)
    # This consensus algorithm uses single-integrator dynamics, so we'll need these mappings.
    si_to_uni_dyn, si_to_uni_states = transformations.create_single_integrator_to_unicycle()
    init = False
    init_dest_0 = d2c(0)
    init_dest_1 = d2c(14)
    si_barrier_cert = create_single_integrator_barrier_certificate(N)
    dest_pose = np.zeros((3, N))
    for k in range(100000):
        # Initialize the single-integrator control inputs
        si_velocities = np.zeros((2, N))
        x = r.get_poses()
        x_si = x[:2, :]
        if not init:
            dest_pose[:,0] = init_dest_0
            dest_pose[:,1] = init_dest_1
            while (np.size(at_pose(x, dest_pose, rotation_error=100)) != N):
                si_velocities = single_integrator_position_controller(x_si
                    , dest_pose[:2, :], magnitude_limit=0.08)
                # Set the velocities of agents 1,...,N
                si_velocities = si_barrier_cert(si_velocities, x_si)
                r.set_velocities(np.arange(N), transformations.single_integrator_to_unicycle2(si_velocities, x))
                # Iterate the simulation
                r.step()
            init = True
        else:
            x = r.get_poses()
            x1 = x[:2,1]
            dest_pose[:,0] = d2c(ctrl.move(c2d(x1)))
            dest_pose[:,1] = d2c(random.choice(ob_next[c2d(x1)]))
         
        while (np.size(at_pose(x, dest_pose, rotation_error=100)) != N):
            si_velocities = single_integrator_position_controller(x_si
                , dest_pose[:2, :], magnitude_limit=0.08)
            # Set the velocities of agents 1,...,N
  #            si_velocities = si_barrier_cert(si_velocities, x_si)
            r.set_velocities(np.arange(N), transformations.single_integrator_to_unicycle2(si_velocities, x))
            # Iterate the simulation
            r.step()

    # Always call this function at the end of your script!!!!
    r.call_at_scripts_end()


if __name__=='__main__':
    main()

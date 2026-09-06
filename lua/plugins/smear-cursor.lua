require("smear_cursor").setup({
    smear_insert_mode = false,					-- 是否在插入模式下播放光标拖影动画
    legacy_computing_symbols_support = true,			-- 字体支持旧式计算机块状 Unicode 字符时启用，使拖影混色更自然

    -- cursor_color = "Cursor",                         -- 拖影颜色，Cursor：跟随光标颜色
    cursor_color = "#00c5ff",
    trailing_exponent = 5,					-- 控制拖影中间节点偏向头部或尾部：大于 1 时更靠近头部
    trailing_stiffness = 0.15,           -- 尾端跟随速度
    damping = 0.5,						-- 移动速度随时间衰减的程度：0 为不衰减，1 为完全衰减
    gradient_exponent = 0,					-- 拖影纵向颜色渐变曲线：0 为无渐变，1 为线性渐变
    gamma = 1,							-- 颜色混合时使用的伽马校正值
    never_draw_over_target = true,				-- 不在目标字符上绘制拖影，以免动画期间遮住该字符
    hide_target_hack = true,					-- 尝试通过在真实光标下绘制字符来隐藏真实光标；需配合上一项使用
    particles_enabled = true,                -- 启用粒子特效
    particle_spread = 0.4,					-- 粒子在光标范围内的发射分布：0 为不扩散，1 为覆盖整个光标
    particles_per_second = 300,					-- 每秒发射的粒子数量
    particles_per_length = 50,					-- 按光标移动距离额外发射的粒子数（每个字符宽度）
    particle_max_lifetime = 800,				-- 粒子的最长存活时间，单位为毫秒
    particle_max_initial_velocity = 20,				-- 粒子的最大初始速度，单位为字符宽度每秒
    particle_velocity_from_cursor = 0.5,			-- 粒子继承光标移动速度的比例：0 为不继承，1 为完全继承
    particle_damping = 0.15,					-- 粒子速度随时间衰减的程度
    particle_gravity = -50,                     -- 粒子加速度，单位为字符宽度每秒平方；负值使粒子向上运动
    min_distance_emit_particles = 0,				-- 触发粒子发射所需的最小移动距离，单位为字符宽度
})
